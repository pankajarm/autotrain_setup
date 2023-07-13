import torch
from datasets import load_dataset
from peft import LoraConfig, get_peft_model, prepare_model_for_int8_training
from transformers import AutoModelForCausalLM, AutoTokenizer, TrainingArguments
from trl import SFTTrainer


model_path = "Salesforce/xgen-7b-8k-base"
train_path = "tatsu-lab/alpaca"
output_dir_path = "xgen_alpaca_lora"

def train():
    # create dataset
    train_dataset = load_dataset(train_path, split="train")
    
    # create tokenizer
    tokenizer = AutoTokenizer.from_pretrained(model_path, trust_remote_code=True)
    tokenizer.pad_token = tokenizer.eos_token
    
    # create model
    model = AutoModelForCausalLM.from_pretrained(
        model_path,
        load_in_4bit=True,
        torch_dtype=torch.float16,
        device_map="auto"
    )

    # resize token embeddings
    model.resize_token_embeddings(len(tokenizer))

    # peft
    model = prepare_model_for_int8_training(model)
    peft_config = LoraConfig(r=16, lora_alpha=32, lora_dropout=0.05, bias="none", task_type="CAUSAL_LM")
    model = get_peft_model(model, peft_config)

    # prepare training args
    training_args = TrainingArguments(
        output_dir=output_dir_path,
        per_device_train_batch=4,
        optim="adamw_torch",
        logging_steps=100,
        learning_rate=2e-4,
        fp16=True,
        warmup_ratio=0.1,
        lr_scheduler_type="linear",
        num_train_epochs=1,
        save_strategy="epoch",
        push_to_hub=True,
    )

    # create SFT Trainer
    trainer = SFTTrainer(
        model=model,
        train_dataset=train_dataset,
        dataset_text_field="text",
        max_seq_length=1024,
        tokenizer=tokenizer,
        args=training_args,
        packing=True,
        peft_config=peft_config,
    )
    # start the training
    trainer.train()
    
    # after training finish, push to HF Hub 
    trainer.push_to_hub()

# main
if __name__ == "__main__":
    train()