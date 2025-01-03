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
        It "Node should be installed" {
            $nodeVersion | Should -Not -BeNullOrEmpty
        }
        It "Node should be version" {
            $nodeVersion | Should -BeExactly "v18.20.5"
        }
    }

    Context "npm Environment" {
        It "npm should be installed" {
            $npmVersion | Should -Not -BeNullOrEmpty
        }
        It "npm should be version 10.8.2" {
            $npmVersion | Should -BeExactly "10.8.2"
        }
    }

    Context "Azure CLI" {
        It "Azure CLI should be installed" {
            $azVersion | Should -Not -BeNullOrEmpty
        }
        It "Azure CLI should be version" {
            $azVersion | Should -Match "azure-cli\s+2\.67\.0\s+core\s+2\.67\.0"
        }
    }

    Context "Java Environment" {
        It "Java should be installed" {
            $javaVersion | Should -Not -BeNullOrEmpty
        }
        It "Java should be version openjdk 11.0.25 and found" {
            $javaVersion | Should -Match "openjdk 11\.0\.25"
        }
    }

    Context "Docker Environment" {
        It "Docker should be installed" {
            $dockerVersion | Should -Not -BeNullOrEmpty
        }
        It "Docker should be version 26.1.3 and found " {
            $dockerVersion | Should -Match "Docker version 26\.1\.3"
        }
    }

    Context "PowerShell Environment" {
        It "PowerShell should be installed" {
            $pwshVersion | Should -Not -BeNullOrEmpty
        }
        It "PowerShell should be version 7.4.6 and found" {
            $pwshVersion | Should -BeExactly "7.4.6"
        }
    }

    Context "Pester Environment" {
        It "Pester should be installed" {
            $pesterVersion | Should -Not -BeNullOrEmpty
        }
        It "Pester should be version 5.6.1" {
            $pesterVersion | Should -BeExactly "5.6.1"
        }
    }

    Context ".NET Environment" {
        It "dotnet should be installed" {
            $dotnetVersion | Should -Not -BeNullOrEmpty
        }
        It "dotnet should be version 8.0.404" {
            $dotnetVersion | Should -BeExactly "8.0.404"
        }
    }

    Context "curl Environment" {
        It "curl should be installed" {
            $curlVersion | Should -Not -BeNullOrEmpty
        }
        It "curl should be version curl 7.81.0 (x86_64-pc-linux-gnu) and found" {
            $curlVersion | Should -Match "curl 7\.81\.0 \(x86_64-pc-linux-gnu\)"
        }
    }

    Context "Git Environment" {
        It "git should be installed" {
            $gitVersion | Should -Not -BeNullOrEmpty
        }
        It "git should be version 2.47.1 and found " {
            $gitVersion | Should -BeExactly "git version 2.47.1"
        }
    }

    Context "Ansible Environment" {
        It "ansible should be installed" {
            $ansibleVersion | Should -Not -BeNullOrEmpty
        }
        It "ansible should be version ansible [core 2.17.7] and found " {
            $ansibleVersion | Should -Match "ansible \[core 2\.17\.7\]"
        }
    }

    Context "jq Environment" {
        It "jq should be installed" {
            $jqVersion | Should -Not -BeNullOrEmpty
        }
        It "jq should be exact version jq-1.6 and found" {
            $jqVersion | Should -BeExactly "jq-1.6"
        }
    }

    Context "Python Environment" {
        It "python should be installed" {
            $pythonVersion | Should -Not -BeNullOrEmpty
        }
        It "python should be exact version Python 3.10.12 and found" {
            $pythonVersion | Should -BeExactly "Python 3.10.12"
        }
    }
}