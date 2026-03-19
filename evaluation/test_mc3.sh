PROMPT_TYPE="qwen25-math-cot"
# Qwen2.5-Math-1.5B-Instruct
export CUDA_VISIBLE_DEVICES="0"
# MODEL_NAME_OR_PATH="Qwen/Qwen2.5-7B-Instruct"
MODEL_NAME_OR_PATH="Qwen/Qwen3-4B-Instruct-2507"
bash sh/eval_mc_s5_l4_p0.5_std0.1.sh $PROMPT_TYPE $MODEL_NAME_OR_PATH

