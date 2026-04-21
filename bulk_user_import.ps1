# 1. Create the Organizational Unit (OU)
$OUPath = "OU=Marketing,DC=toronto,DC=local"
if (!(Get-ADOrganizationalUnit -Filter "Name -eq 'Marketing'")) {
    New-ADOrganizationalUnit -Name "Marketing" -Path "DC=toronto,DC=local"
    Write-Host "OU 'Marketing' created successfully." -ForegroundColor Green
}

# 2. Import the CSV data
$UserData = Import-Csv "C:\Lab\users.csv"

# 3. Loop through each user and create them in AD
foreach ($User in $UserData) {
    $Password = ConvertTo-SecureString "Toronto2026!" -AsPlainText -Force

    $UserParams = @{
        Name                  = "$($User.firstname) $($User.lastname)"
        GivenName             = $User.firstname
        Surname               = $User.lastname
        SamAccountName        = $User.username
        UserPrincipalName     = "$($User.username)@toronto.local"
        Path                  = $OUPath
        AccountPassword       = $Password
        Enabled               = $true
        ChangePasswordAtLogon = $true
    }

    try {
        New-ADUser @UserParams
        Write-Host "Successfully created: $($User.username)" -ForegroundColor Cyan
    } catch {
        Write-Host "Error creating $($User.username): $($_.Exception.Message)" -ForegroundColor Red
    }
}