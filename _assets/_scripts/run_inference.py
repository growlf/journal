import torch
from transformers import AutoModelForCausalLM, AutoTokenizer, BitsAndBytesConfig
model_id = "HuggingFaceTB/SmolLM-1.7B-Instruct"
bnb_config = BitsAndBytesConfig(
    load_in_4bit=True,
    bnb_4bit_use_double_quant=True,
    bnb_4bit_quant_type="nf4",
    bnb_4bit_compute_dtype=torch.bfloat16
)
print(f"--- Loading Validation Model: {model_id} ---")
tokenizer = AutoTokenizer.from_pretrained(model_id)
model = AutoModelForCausalLM.from_pretrained(
    model_id,
    quantization_config=bnb_config,
    device_map="auto"
)
messages = [{"role": "user", "content": "Hello RTX 3090! Confirmed your VRAM status."}]
prompt = tokenizer.apply_chat_template(messages, add_generation_prompt=True, tokenize=False)
inputs = tokenizer(prompt, return_tensors="pt").to("cuda")
print("--- Generating Response ---")
with torch.no_grad():
    outputs = model.generate(
        input_ids=inputs["input_ids"],
        attention_mask=inputs["attention_mask"],
        max_new_tokens=100, 
        do_sample=True, 
        temperature=0.7, 
        top_p=0.9
    )
prompt_len = inputs["input_ids"].shape[1]
response = tokenizer.decode(outputs[0][prompt_len:], skip_special_tokens=True)
print("\n--- Model Response ---")
print(response)
