CUDA_VISIBLE_DEVICES=0 torchrun --nproc_per_node=1 train_lora.py \
    --data_path sql_finetune_data.json \
    --output_dir work_dir/alpaca_full-finetune \
    --num_train_epochs 3 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 8 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 500 \
    --save_total_limit 5 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --optim "adamw_torch" \
    --lr_scheduler_type "cosine" \
    --model_max_length 2048 \
    --logging_steps 1 \
    --do_train \
    --do_eval \
    --gradient_checkpointing True \
    --deepspeed "scripts/ds_config/zero3_auto.json"