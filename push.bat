@echo off
chcp 65001 > nul
title GitHub Release Push Otomasyonu

echo ===================================================
echo             GITHUB UPDATE PUSH ARACI
echo ===================================================
echo.

:: 1. Dosyaları Ekle
echo [1/4] setup.exe ve update.json ekleniyor...
git add setup.exe update.json
echo.

:: 2. Commit Mesajı Al
set /p commit_msg="[2/4] Commit mesajını girin (Boş bırakırsan varsayılan atar): "

if "%commit_msg%"=="" (
    set commit_msg=update: setup.exe ve update.json güncellendi
)

echo.
echo Commit atılıyor: "%commit_msg%"
git commit -m "%commit_msg%"
echo.

:: 3. Repo ve Durum Bilgisi Göster
echo ===================================================
echo [3/4] Hedeﬂenen GitHub Reposu (Remote):
echo ===================================================
git remote -v
echo.
echo Gönderilecek Değişiklikler:
git status -s
echo ===================================================
echo.

:: 4. Onay Alma
set /p confirm="[4/4] Yukarıdaki repoya PUSH yapmak istediğinden EMİN MİSİN? (E/H): "

if /i "%confirm%"=="E" (
    echo.
    echo GitHub'a pushlanıyor, lütfen bekle...
    git push
    echo.
    echo ===================================================
    echo [OK] Push işlemi başarıyla tamamlandı!
    echo ===================================================
) else (
    echo.
    echo [!] Push işlemi iptal edildi. 
    echo (Değişiklikler yerelde commit atıldı ama GitHub'a gönderilmedi.)
)

echo.
pause