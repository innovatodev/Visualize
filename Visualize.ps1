<#
        .SYNOPSIS
            Visualize Any PSObject Object
        .DESCRIPTION
            Script used to visualize any PSObject(s) from scriptblocks, it will list all properties and values in a TreeView Form.
#>
$P_DEBUG = $true
$P_VERBOSE = $false
. .\window.ps1
Function Visualize
{
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock]
        $ScriptBlock
    )
    $RACINE = $TREE.Nodes.ADD($ScriptBlock.ToString())
    $COMMAND = Invoke-Command -ScriptBlock $ScriptBlock -ErrorAction Stop
    $C1 = 0
    foreach ($object in $COMMAND)
    {
        $C1++
        $LVL0 = $RACINE.NODES.ADD($C1)
        $MEMBERS = $object
        $C2 = 0
        foreach ($member in $MEMBERS.psobject.properties)
        {
            foreach ($prop in $member)
            {
                if (($prop.Value.GetType()) -notmatch "Collection" -and (($prop.Value.GetType())) -notmatch "Cim"  ) # NOT COLLECTION
                {
                    $C2++
                    if ($P_VERBOSE)
                    {
                        Write-Host ($prop.Value.GetType())
                        Write-Host $prop.Name" = "$prop.Value" [" $prop.Value.GetType() "]"
                    }
                    $LVL1 = $LVL0.NODES.ADD($prop.Name + " [" + $prop.Value.GetType() + "]")
                    [bool]$global:found = $false
                    if ( $prop.Name -eq "Name" )
                    {
                        if ($global:found -ne $true)
                        {
                            $global:found = $true
                            if ($P_VERBOSE)
                            {
                                Write-Host $prop.Value
                            }
                            $LVL0.Text = $prop.Value
                        }
                    }
                    $LVL1.NODES.ADD($prop.Value.ToString())
                }
                else # COLLECTION, CIM
                {
                    $C2++
                    if ($P_VERBOSE)
                    {
                        Write-Host ($prop.Value.GetType())
                    }
                    $LVL1 = $LVL0.NODES.ADD($prop.Name)
                    foreach ($val in $prop.Value)
                    {
                        if ($P_VERBOSE)
                        {
                            Write-Host ($val.GetType())
                            Write-Host $prop.Name " = " $val.ToString()
                        }
                        $LVL2 = $LVL1.NODES.ADD($val.ToString())
                        $C2++
                    }
                }
            }
        }
    }
    if ($P_DEBUG)
    {
        Write-Host $ScriptBlock -ForegroundColor Red
        Write-Host $C1 "OBJECTS" -ForegroundColor Green -NoNewline
        Write-Host " " -NoNewline
        Write-Host $C2 "PROPERTIES" -ForegroundColor Blue -NoNewline
        Write-Host " " -NoNewline
        Write-Host ($C1 * $C2) "TOTAL" -ForegroundColor Yellow -NoNewline
        Write-Host ""
    }
}
