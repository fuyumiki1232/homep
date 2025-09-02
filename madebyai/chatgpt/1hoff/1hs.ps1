# 目標時間（秒）: 1時間 = 3600秒
$targetSeconds = 3600
$countedSeconds = 0

# マウス座標取得の準備
Add-Type -AssemblyName System.Windows.Forms
$lastX = [System.Windows.Forms.Cursor]::Position.X
$lastY = [System.Windows.Forms.Cursor]::Position.Y

Write-Host "マウスが動いている間だけカウントします。1時間でPCをシャットダウンします。"

while ($countedSeconds -lt $targetSeconds) {
    Start-Sleep -Seconds 1

    $pos = [System.Windows.Forms.Cursor]::Position
    if ($pos.X -ne $lastX -or $pos.Y -ne $lastY) {
        $countedSeconds++
        Write-Host "カウント中: $countedSeconds / $targetSeconds 秒"
    }

    $lastX = $pos.X
    $lastY = $pos.Y
}

Write-Host "1時間に達しました。PCをシャットダウンします。"
shutdown /s /t 60 /c "1時間が経過しました。60秒後にこのPCはシャットダウンされます…"