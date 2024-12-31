BeforeAll {
    $nodeVersion = node --version
    $npmVersion = npm --version
    $azVersion = az --version | Out-String
    $javaVersion = java --version | Out-String
    $dockerVersion = docker --version
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
            $azVersion | Should -Match "azure-cli\s+\d+\.\d+\.\d+" -Because "Azure CLI version format is invalid."
        }
        It "Azure CLI should be a specific version" {
            $azVersion | Should -Match "azure-cli\s+2\.67\.0" -Because "Azure CLI version does not match the expected value."
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
}