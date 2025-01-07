BeforeAll {
    $nodeVersion = node --version
    $npmVersion = npm --version
    $azVersion = az --version | Out-String
    $javaVersion = java --version | Out-String
    $dockerVersion = docker --version
    $curlVersion = curl --version | Out-String
    $pwshVersion = $PSVersionTable.PSVersion.ToString()
    $pesterVersion = (Get-Module -Name Pester -ListAvailable).Version.ToString()
    $dotnetVersion = dotnet --version
    $gitVersion = git --version
    $ansibleVersion = ansible --version | Select-Object -First 1
    $jqVersion = jq --version
    $pythonVersion = python3 --version
}

Describe "Development Environment Validation" {

    Context "Node.js Environment" {
        It "Node should be version v18.20.1" {
            $nodeVersion | Should -BeExactly "v18.20.1" -Because "Expected Node version v18.20.1 but found $nodeVersion"
        }
    }

    Context "npm Environment" {
        It "npm should be version 10.8.2" {
            if ($npmVersion -eq "10.8.2") {
                $npmVersion | Should -BeExactly "10.8.2"
            } else {
                throw "Expected npm version 10.8.2 but found $npmVersion"
            }
        }
    }

    Context "azure CLI" {
        It "azure CLI should be version 2.67.0" {
            if ($azVersion -match "azure-cli\s+2\.67\.0\s+core\s+2\.67\.0") {
                $azVersion | Should -Match "azure-cli\s+2\.67\.0\s+core\s+2\.67\.0"
            } else {
                throw "Expected Azure CLI version 2.67.0 but found $azVersion"
            }
        }
    }

    Context "Java Environment" {
        It "Java should be version openjdk 11.0.25" {
            if ($javaVersion -match "openjdk 11\.0\.25") {
                $javaVersion | Should -Match "openjdk 11\.0\.25"
            } else {
                throw "Expected Java version openjdk 11.0.25 but found $javaVersion"
            }
        }
    }

    Context "Docker Environment" {
        It "Docker should be version 26.1.3" {
            if ($dockerVersion -match "Docker version 26\.1\.3") {
                $dockerVersion | Should -Match "Docker version 26\.1\.3"
            } else {
                throw "Expected Docker version 26.1.3 but found $dockerVersion"
            }
        }
    }

    Context "PowerShell Environment" {
        It "PowerShell should be version 7.4.6" {
            if ($pwshVersion -eq "7.4.6") {
                $pwshVersion | Should -BeExactly "7.4.6"
            } else {
                throw "Expected PowerShell version 7.4.6 but found $pwshVersion"
            }
        }
    }

    Context "Pester Environment" {
        It "Pester should be version 5.6.1" {
            if ($pesterVersion -eq "5.6.1") {
                $pesterVersion | Should -BeExactly "5.6.1"
            } else {
                throw "Expected Pester version '5.6.1' but found '$pesterVersion'"
            }
        }
    }

    Context ".NET Environment" {
        It "dotnet should be version 8.0.404" {
            if ($dotnetVersion -eq "8.0.404") {
                $dotnetVersion | Should -BeExactly "8.0.404"
            } else {
                throw "Expected dotnet version '8.0.404' but found '$dotnetVersion'"
            }
        }
    }

    Context "curl Environment" {
        It "curl should be version curl 7.81.0 (x86_64-pc-linux-gnu)" {
            if ($curlVersion -match "curl 7\.81\.0 \(x86_64-pc-linux-gnu\)") {
                $curlVersion | Should -Match "curl 7\.81\.0 \(x86_64-pc-linux-gnu\)"
            } else {
                throw "Expected curl version 'curl 7.81.0 (x86_64-pc-linux-gnu)' but found '$curlVersion'"
            }
        }
    }

    Context "Git Environment" {
        It "git should be version 2.47.1" {
            if ($gitVersion -eq "git version 2.47.1") {
                $gitVersion | Should -BeExactly "git version 2.47.1"
            } else {
                throw "Expected git version '2.47.1' but found '$gitVersion'"
            }
        }
    }

    Context "Ansible Environment" {
        It "ansible should be version ansible [core 2.17.7]" {
            if ($ansibleVersion -match "ansible \[core 2\.17\.7\]") {
                $ansibleVersion | Should -Match "ansible \[core 2\.17\.7\]"
            } else {
                throw "Expected ansible version 'ansible [core 2.17.7]' but found '$ansibleVersion'"
            }
        }
    }

    Context "jq Environment" {
        It "jq should be exact version jq-1.6" {
            if ($jqVersion -eq "jq-1.6") {
                $jqVersion | Should -BeExactly "jq-1.6"
            } else {
                throw "Expected jq version 'jq-1.6' but found '$jqVersion'"
            }
        }
    }

    Context "Python Environment" {
        It "python should be exact version Python 3.10.12" {
            if ($pythonVersion -eq "Python 3.10.12") {
                $pythonVersion | Should -BeExactly "Python 3.10.12"
            } else {
                throw "Expected Python version 'Python 3.10.12' but found '$pythonVersion'"
            }
        }
    }
}
