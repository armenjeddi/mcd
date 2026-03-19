# make_aime25_like_aime24.py
import json
from datasets import load_dataset

OUT_PATH = "aime25.jsonl"

# Match your aime24 id range behavior: aime24 was 60..89 (30 items).
# So we’ll set aime25 to 90..119 by default.
ID_OFFSET = 90

ds = load_dataset("yentinglin/aime_2025", split="train")  # 30 rows :contentReference[oaicite:1]{index=1}

with open(OUT_PATH, "w", encoding="utf-8") as f:
    for i, ex in enumerate(ds):
        problem = ex["problem"].strip()
        answer = str(ex["answer"]).strip()

        row = {
            "id": ID_OFFSET + i,
            "problem": problem,
            "solution": str(ex.get("solution", answer)).strip(),
            "answer": answer,
            "url": ex.get("url", "").strip(),
            "question": problem,  # your aime24 duplicates problem here
        }
        f.write(json.dumps(row, ensure_ascii=False) + "\n")

print(f"Wrote {len(ds)} rows -> {OUT_PATH}")
