# Calculate the SHA256 hash of setup.py
$currentHash = (Get-FileHash .\utils_lib\setup.py -Algorithm SHA256).Hash

# Replace this with the original trusted SHA256 hash
$trustedHash = "6e0c399aca8b0b0dd194c8ed9489ff4ac8311bc26d9372826cee22e8a45471eb"

# Verify integrity before installation
if ($currentHash -ne $trustedHash) {
    Write-Host "ERROR: setup.py has been modified. Installation blocked." -ForegroundColor Red
}
else {
    Write-Host "Hash verified. Installing dependencies..." -ForegroundColor Green
    pip install -r requirements.txt
}

