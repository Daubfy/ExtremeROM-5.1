#!bin/bash
# -----------------------------------------------------------------------------
# Firmware handling
# -----------------------------------------------------------------------------

#echo
#echo "[INFO] Downloading source firmware"
#echo

# source ./buildenv.sh a24
# ./scripts/download_fw.sh --force --ignore-target

#echo
#echo "[INFO] Extracting source firmware"
#echo

#source ./buildenv.sh a24
#./scripts/extract_fw.sh --force --ignore-target

#echo
#echo "[INFO] Downloading target firmware"
#echo

#source ./buildenv.sh a24
#./scripts/download_fw.sh -v A245MUBSADYG1 --force --ignore-source

echo
echo "[INFO] Extracting target firmware"
echo

source ./buildenv.sh a24
./scripts/extract_fw.sh --force --ignore-source

# -----------------------------------------------------------------------------
# Build ROM
# -----------------------------------------------------------------------------

echo
echo "[INFO] Building ROM"
echo

source ./buildenv.sh a24
./scripts/make_rom.sh --force

# -----------------------------------------------------------------------------
# Output handling
# -----------------------------------------------------------------------------

ZIP_FILE="$(find out -maxdepth 1 -type f -name '*.zip' | head -n 1 || true)"

if [[ -z "${ZIP_FILE}" ]]; then
    echo "[ERROR] No ZIP file found in out/"
    exit 1
fi

echo
echo "[INFO] Build output:"
echo "  File: ${ZIP_FILE}"
echo

echo "MD5:"
md5sum "${ZIP_FILE}"

echo
echo "SHA256:"
sha256sum "${ZIP_FILE}"

# -----------------------------------------------------------------------------
# Upload (optional)
# -----------------------------------------------------------------------------

if [[ -n "${GOFILE_TOKEN:-}" && -n "${GOFILE_FOLDER_ID:-}" ]]; then
    echo
    echo "[INFO] Uploading to GoFile"
    echo

    RESPONSE="$(
        curl -s \
            -F "file=@${ZIP_FILE}" \
            -F "token=${GOFILE_TOKEN}" \
            -F "folderId=${GOFILE_FOLDER_ID}" \
            https://upload-eu-par.gofile.io/uploadFile
    )"

    echo "Download link:"
    echo "${RESPONSE}" | jq -r '.data.downloadPage'
else
    echo
    echo "[INFO] GoFile upload skipped (env vars not set)"
fi

echo
echo "[INFO] ExtremeROM build completed successfully"
echo
