#Base WebServer Configuration
# test on 28/06
Configuration ConfigureMIMVM
{
    Node webserver
    {
        WindowsFeature IIS
        {
            Ensure = "Present"
            Name = "Web-Server"
        }
        WindowsFeature ASP
        {
            Ensure = "Present"
            Name = "Web-ASP-Net45"
        }
    }
}
ConfigureMIMVM

