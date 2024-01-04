@echo off
setlocal

curl.exe --verbose --fail https://httpbin.org/get?hello=world --output ./data/input/input.json || goto :error

exit /b 0

:error
exit /b %errorlevel%
