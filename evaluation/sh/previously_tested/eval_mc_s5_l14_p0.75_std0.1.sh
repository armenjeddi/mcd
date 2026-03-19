set -ex

PROMPT_TYPE=$1
MODEL_NAME_OR_PATH=$2
OUTPUT_DIR=${MODEL_NAME_OR_PATH}_mc_s5_l14_p0.75_std0.1_tbd/math_eval

SPLIT="test"
NUM_TEST_SAMPLE=100

# noise from 0.25 to 0.1
MC_SAMPLES=5
MC_START_LAYER=14
MC_AUGMENT_P=0.75
MC_NOISE_STD=0.1


# English open datasets
DATA_NAME="gsm8k,math,svamp,asdiv,mawps,carp_en,tabmwp,minerva_math,gaokao2023en,olympiadbench,college_math"
# DATA_NAME="olympiadbench,college_math"
TOKENIZERS_PARALLELISM=false \
python3 -u math_eval.py \
    --model_name_or_path ${MODEL_NAME_OR_PATH} \
    --data_name ${DATA_NAME} \
    --output_dir ${OUTPUT_DIR} \
    --split ${SPLIT} \
    --prompt_type ${PROMPT_TYPE} \
    --num_test_sample ${NUM_TEST_SAMPLE} \
    --seed 0 \
    --temperature 0 \
    --n_sampling 1 \
    --top_p 1 \
    --start 0 \
    --end -1 \
    --save_outputs \
    --overwrite \
    --mc_samples ${MC_SAMPLES} \
    --mc_start_layer ${MC_START_LAYER} \
    --mc_augment_p ${MC_AUGMENT_P} \
    --mc_noise_std ${MC_NOISE_STD} 


# English multiple-choice datasets
DATA_NAME="aqua,sat_math,mmlu_stem"
TOKENIZERS_PARALLELISM=false \
python3 -u math_eval.py \
    --model_name_or_path ${MODEL_NAME_OR_PATH} \
    --data_name ${DATA_NAME} \
    --output_dir ${OUTPUT_DIR} \
    --split ${SPLIT} \
    --prompt_type ${PROMPT_TYPE} \
    --num_test_sample ${NUM_TEST_SAMPLE} \
    --seed 0 \
    --temperature 0 \
    --n_sampling 1 \
    --top_p 1 \
    --start 0 \
    --end -1 \
    --save_outputs \
    --overwrite \
    --mc_samples ${MC_SAMPLES} \
    --mc_start_layer ${MC_START_LAYER} \
    --mc_augment_p ${MC_AUGMENT_P} \
    --mc_noise_std ${MC_NOISE_STD} \
    --num_shots 5 

# Chinese gaokao collections
DATA_NAME="gaokao2024_I,gaokao2024_II,gaokao2024_mix,gaokao_math_cloze,gaokao_math_qa"
TOKENIZERS_PARALLELISM=false \
python3 -u math_eval.py \
    --model_name_or_path ${MODEL_NAME_OR_PATH} \
    --data_name ${DATA_NAME} \
    --output_dir ${OUTPUT_DIR} \
    --split ${SPLIT} \
    --prompt_type ${PROMPT_TYPE} \
    --num_test_sample ${NUM_TEST_SAMPLE} \
    --seed 0 \
    --temperature 0 \
    --n_sampling 1 \
    --top_p 1 \
    --start 0 \
    --end -1 \
    --save_outputs \
    --overwrite \
    --adapt_few_shot \
    --mc_samples ${MC_SAMPLES} \
    --mc_start_layer ${MC_START_LAYER} \
    --mc_augment_p ${MC_AUGMENT_P} \
    --mc_noise_std ${MC_NOISE_STD} \


# Chinese other datasets
DATA_NAME="cmath,cn_middle_school"
TOKENIZERS_PARALLELISM=false \
python3 -u math_eval.py \
    --model_name_or_path ${MODEL_NAME_OR_PATH} \
    --data_name ${DATA_NAME} \
    --output_dir ${OUTPUT_DIR} \
    --split ${SPLIT} \
    --prompt_type ${PROMPT_TYPE} \
    --num_test_sample ${NUM_TEST_SAMPLE} \
    --seed 0 \
    --temperature 0 \
    --n_sampling 1 \
    --top_p 1 \
    --start 0 \
    --end -1 \
    --save_outputs \
    --overwrite \
    --mc_samples ${MC_SAMPLES} \
    --mc_start_layer ${MC_START_LAYER} \
    --mc_augment_p ${MC_AUGMENT_P} \
    --mc_noise_std ${MC_NOISE_STD} \
    --adapt_few_shot \



# English competition datasets
DATA_NAME="aime24,amc23"
TOKENIZERS_PARALLELISM=false \
python3 -u math_eval.py \
    --model_name_or_path ${MODEL_NAME_OR_PATH} \
    --data_name ${DATA_NAME} \
    --output_dir ${OUTPUT_DIR} \
    --split ${SPLIT} \
    --prompt_type ${PROMPT_TYPE} \
    --num_test_sample ${NUM_TEST_SAMPLE} \
    --seed 0 \
    --temperature 0 \
    --n_sampling 1 \
    --top_p 1 \
    --start 0 \
    --end -1 \
    --save_outputs \
    --overwrite \
    --mc_samples ${MC_SAMPLES} \
    --mc_start_layer ${MC_START_LAYER} \
    --mc_augment_p ${MC_AUGMENT_P} \
    --mc_noise_std ${MC_NOISE_STD} \

