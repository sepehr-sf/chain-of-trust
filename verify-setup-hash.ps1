# Calculate the SHA256 hash of setup.py
$currentHash = (Get-FileHash .\utils_lib\setup.py -Algorithm SHA256).Hash

# Replace this with the original trusted SHA256 hash
$trustedHash = "hash=sha256:c0263bc00e2170c76e5cd7599fe63d047c22262673b622256feb2749a84b7113"

# Verify integrity before installation
if ($currentHash -ne $trustedHash) {
    Write-Host "ERROR: setup.py has been modified. Installation blocked." -ForegroundColor Red
}
else {
    Write-Host "Hash verified. Installing dependencies..." -ForegroundColor Green
    pip install -r requirements.txt
}

