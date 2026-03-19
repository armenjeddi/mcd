PROMPT_TYPE="qwen25-math-cot"
# Qwen2.5-Math-1.5B-Instruct
export CUDA_VISIBLE_DEVICES="0"
MODEL_NAME_OR_PATH="Qwen/Qwen2.5-7B-Instruct"
bash sh/eval_mc_s15_l24_p0.5_std0.1.sh $PROMPT_TYPE $MODEL_NAME_OR_PATH

