. .\Visualize.ps1
Clear-Host
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-Service -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-AppxPackage -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-Process -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-Item "$env:windir\*" -Force -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-Date -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-ScheduledTask -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-Disk -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-NetFirewallRule -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-Module -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-NetAdapter -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-NetAdapterHardwareInfo -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-NetAdapterStatistics -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-DnsClientGlobalSetting -ErrorAction SilentlyContinue | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-EventLog -LogName System -Newest 10 | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-NetConnectionProfile | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-NetRoute | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-HotFix | Select-Object -Property * } }).TotalMilliseconds
(Measure-Command -Expression { $null = Visualize -ScriptBlock { Get-MpPreference | Select-Object -Property * } }).TotalMilliseconds

WINDOW
