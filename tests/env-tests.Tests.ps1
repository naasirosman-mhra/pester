BeforeAll {
    $nodeVersion = node --version
    $npmVersion = npm --version
    $azVersion = az --version | Out-String
    $javaVersion = java --version | Out-String
    $dockerVersion = docker --version
    $curlVersion = curl --version | Select-Object -First 1
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
        It "Node should be a valid version" {
            $nodeVersion | Should -Match "v\d+\.\d+\.\d+"
        }
        It "Node should be a specific version" {
            $nodeVersion | Should -BeExactly "v20.18.1"
        }
    }

    Context "npm Environment" {
        It "npm should be installed" {
            $npmVersion | Should -Not -BeNullOrEmpty
        }
        It "npm should be a valid version" {
            $npmVersion | Should -Match "\d+\.\d+\.\d+"
        }
        It "npm should be a specific version" {
            $npmVersion | Should -BeExactly "10.8.2"
        }
    }

    Context "Azure CLI" {
        It "Azure CLI should be installed" {
            $azVersion | Should -Not -BeNullOrEmpty
        }
        It "Azure CLI should be a valid version" {
            $azVersion | Should -Match "azure-cli\s+\d+\.\d+\.\d+"
        }
        It "Azure CLI should be a specific version" {
            $azVersion | Should -Match "azure-cli\s+2\.67\.0"
        }
    }
    

    Context "Java Environment" {
        It "Java should be installed" {
            $javaVersion | Should -Not -BeNullOrEmpty
        }
        It "Java should be a valid version" {
            $javaVersion | Should -Match "openjdk \d+\.\d+\.\d+"
        }
        It "Java should be a specific version" {
            $javaVersion | Should -Match "openjdk 17.0.13" 
        }
    }

    Context "Docker Environment" {
        It "Docker should be installed" {
            $dockerVersion | Should -Not -BeNullOrEmpty
        }
        It "Docker should be a valid version" {
            $dockerVersion | Should -Match "Docker version \d+\.\d+\.\d+"
        }
        It "Docker should be a specific version" {
            $dockerVersion | Should -Match "Docker version 26.1.3" 
        }
    }
    Context "PowerShell Environment" {
        It "PowerShell should be installed" {
            $pwshVersion | Should -Not -BeNullOrEmpty
        }
        It "PowerShell should be a valid version" {
            $pwshVersion | Should -Match "^\d+\.\d+\.\d+"
        }
        It "PowerShell should be a specific version" {
            $pwshVersion | Should -Match "^7\." 
        }
    }

    Context "Pester Environment" {
        It "Pester should be installed" {
            $pesterVersion | Should -Not -BeNullOrEmpty 
        }
        It "Pester should be a valid version" {
            $pesterVersion | Should -Match "^\d+\.\d+\.\d+" 
        }
    }

    Context ".NET Environment" {
        It "dotnet should be installed" {
            $dotnetVersion | Should -Not -BeNullOrEmpty
        }
        It "dotnet should be a valid version" {
            $dotnetVersion | Should -Match "^\d+\.\d+\.\d+"
        }
        It "dotnet should be a specific version" {
            $dotnetVersion | Should -Match "^7\.|^6\."
        }
    }

    Context "curl Environment" {
        It "curl should be installed" {
            $curlVersion | Should -Not -BeNullOrEmpty 
        }
        It "curl should be a valid version" {
            $curlVersion | Should -Match "curl \d+\.\d+\.\d+" 
        }
    }

    Context "Git Environment" {
        It "git should be installed" {
            $gitVersion | Should -Not -BeNullOrEmpty
        }
        It "git should be a valid version" {
            $gitVersion | Should -Match "git version \d+\.\d+\.\d+"
        }
    }

    Context "Ansible Environment" {
        It "ansible should be installed" {
            $ansibleVersion | Should -Not -BeNullOrEmpty
        }
        It "ansible should be a valid version" {
            $ansibleVersion | Should -Match "ansible \[core \d+\.\d+\.\d+\]" 
        }
    }

    Context "jq Environment" {
        It "jq should be installed" {
            $jqVersion | Should -Not -BeNullOrEmpty 
        }
        It "jq should be a valid version" {
            $jqVersion = jq --version
            $jqVersion | Should -Match "jq-\d+\.\d+"
        }
    }

    Context "Python Environment" {
        It "python should be installed" {
            $pythonVersion | Should -Not -BeNullOrEmpty
        }
        It "python should be a valid version" {
            $pythonVersion | Should -Match "Python \d+\.\d+\.\d+"
        }
        It "python should be version 3.x" {
            $pythonVersion | Should -Match "Python 3\."
        }
    }
}