#!/usr/bin/env bash

# JSON objectを初期化
json_obj="{}"

# packagesディレクトリ内の各ファイルに対して
for item in $(find packages -type f | awk -F'/' '{print $2}')
do
    key=$(echo $item | rev | cut -d. -f2- | rev)
    # JSON objectに新しいキーと値を追加
    json_obj=$(echo $json_obj | jq --arg key "$key" --arg value "https://raw.githubusercontent.com/Harukaze9/JACT-Packages/main/packages/$item" '. + {($key): $value}')
done

# JSON objectを出力
echo $json_obj > manifest.json
