[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[System.Windows.Forms.Application]::EnableVisualStyles()
$MainWindow = New-Object 'System.Windows.Forms.Form'
$TREE = New-Object 'System.Windows.Forms.TreeView'
$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
$ErrorActionPreference = 'SilentlyContinue'
function WINDOW
{
    $Form_StateCorrection_Load = { $MainWindow.WindowState = $InitialFormWindowState }
    $Form_StoreValues_Closing = { if ($null -ne $TREE.SelectedNode) { $script:MainForm_TREE = $TREE.SelectedNode.Text }else { $script:MainForm_TREE = $null } }
    $Form_Cleanup_FormClosed = {
        try
        {
            $MainWindow.remove_Load($MainWindow_Load)
            $MainWindow.remove_Load($Form_StateCorrection_Load)
            $MainWindow.remove_Closing($Form_StoreValues_Closing)
            $MainWindow.remove_FormClosed($Form_Cleanup_FormClosed)
        }
        catch { Out-Null }
    }
    $MainWindow.SuspendLayout()
    $MainWindow.Controls.Add($TREE)
    $MainWindow.AutoScaleDimensions = New-Object System.Drawing.SizeF(6, 13)
    $MainWindow.AutoScaleMode = 'Font'
    $MainWindow.AutoScroll = $True
    $MainWindow.AutoSize = $True
    $MainWindow.ClientSize = New-Object System.Drawing.Size(784, 561)
    $MainWindow.Name = 'visualize'
    $MainWindow.StartPosition = 'CenterScreen'
    $MainWindow.Text = 'visualize'
    $MainWindow.TopMost = $True
    $TREE.Anchor = 'Top, Bottom, Left, Right'
    $TREE.Location = New-Object System.Drawing.Point(2, 0)
    $TREE.Name = 'TREE'
    $TREE.Size = New-Object System.Drawing.Size(780, 560)
    $TREE.TabIndex = 0
    $MainWindow.ResumeLayout()
    $InitialFormWindowState = $MainWindow.WindowState
    $MainWindow.add_Load($Form_StateCorrection_Load)
    $MainWindow.add_FormClosed($Form_Cleanup_FormClosed)
    $MainWindow.add_Closing($Form_StoreValues_Closing)
    $MainWindow.ShowDialog()
}
