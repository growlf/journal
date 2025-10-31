---
management_url: http://192.168.42.127:81/
---
NGINX Proxy Manager is a tool that provides a user-friendly web interface for managing an Nginx reverse proxy, simplifying the process of exposing services to the internet. It automates tasks like securing applications with free SSL certificates from [Let's Encrypt](https://www.google.com/search?num=10&newwindow=1&sca_esv=5174aa7661d349ca&cs=1&sxsrf=AE3TifMsH5p6EVpQF2-_u0BfRtVF82yYaw%3A1761680722419&q=Let%27s+Encrypt&sa=X&ved=2ahUKEwjglIuN1MeQAxXhlu4BHTDQLTcQxccNegQIBBAB&mstk=AUtExfCTOPEg4kyqqXrOT1iWP59P0hsr2260ISG3FSRrGhYgY0gSygOrsv_09pwnk44OWsG5Tte7D6e8laxhUfXCvvaWGrkQCD8GsI6s73a7dfJfaKpL5vzVwK5iZQSOWy5_1-z9bR34mAXowdnO3an4xLnm4WAAmCYE3CL6i7Sn5HJS3U8&csui=3), which automatically renew, and handles domain mapping, custom SSL certificates, and advanced Nginx configurations without requiring users to manually edit configuration files. It is often deployed using Docker, making it easy to set up and manage, especially for home server users who want to securely host applications. 

Key features
- **Web-based interface:** 
    A graphical user interface (GUI) to manage Nginx, eliminating the need to write complex Nginx configuration files manually.     
- **Free SSL Certificates:** 
    Built-in support for Let's Encrypt to automatically generate and renew free SSL/TLS certificates for your domains. 
- **Domain and host management:** 
    Easily create and manage proxy hosts, forwards, and redirects for different domains and subdomains. 
- **Security controls:** 
    Allows for the implementation of access lists, HTTP authentication, and other security features to protect your services. 
- **Customization:** 
    Offers advanced Nginx configuration options for those who need them, alongside the default easy-to-use settings. 
- **User management:** 
    Allows for creating different users with specific permissions to manage their own hosts. 
- **Container-friendly:** 
    Designed to run in a Docker container, which makes it easy to deploy, manage, and integrate with other Dockerized applications. 

How it simplifies tasks
- **Exposing self-hosted services:** 
    It makes it simple to securely expose services on your home network (like [Plex](https://www.google.com/search?num=10&newwindow=1&sca_esv=5174aa7661d349ca&cs=1&sxsrf=AE3TifMsH5p6EVpQF2-_u0BfRtVF82yYaw%3A1761680722419&q=Plex&sa=X&ved=2ahUKEwjglIuN1MeQAxXhlu4BHTDQLTcQxccNegQIQBAB&mstk=AUtExfCTOPEg4kyqqXrOT1iWP59P0hsr2260ISG3FSRrGhYgY0gSygOrsv_09pwnk44OWsG5Tte7D6e8laxhUfXCvvaWGrkQCD8GsI6s73a7dfJfaKpL5vzVwK5iZQSOWy5_1-z9bR34mAXowdnO3an4xLnm4WAAmCYE3CL6i7Sn5HJS3U8&csui=3), [Nextcloud](https://www.google.com/search?num=10&newwindow=1&sca_esv=5174aa7661d349ca&cs=1&sxsrf=AE3TifMsH5p6EVpQF2-_u0BfRtVF82yYaw%3A1761680722419&q=Nextcloud&sa=X&ved=2ahUKEwjglIuN1MeQAxXhlu4BHTDQLTcQxccNegQIQBAC&mstk=AUtExfCTOPEg4kyqqXrOT1iWP59P0hsr2260ISG3FSRrGhYgY0gSygOrsv_09pwnk44OWsG5Tte7D6e8laxhUfXCvvaWGrkQCD8GsI6s73a7dfJfaKpL5vzVwK5iZQSOWy5_1-z9bR34mAXowdnO3an4xLnm4WAAmCYE3CL6i7Sn5HJS3U8&csui=3), or [Bitwarden](https://www.google.com/search?num=10&newwindow=1&sca_esv=5174aa7661d349ca&cs=1&sxsrf=AE3TifMsH5p6EVpQF2-_u0BfRtVF82yYaw%3A1761680722419&q=Bitwarden&sa=X&ved=2ahUKEwjglIuN1MeQAxXhlu4BHTDQLTcQxccNegQIQBAD&mstk=AUtExfCTOPEg4kyqqXrOT1iWP59P0hsr2260ISG3FSRrGhYgY0gSygOrsv_09pwnk44OWsG5Tte7D6e8laxhUfXCvvaWGrkQCD8GsI6s73a7dfJfaKpL5vzVwK5iZQSOWy5_1-z9bR34mAXowdnO3an4xLnm4WAAmCYE3CL6i7Sn5HJS3U8&csui=3)) to the internet. 
- **Automating SSL:** 
    It removes the manual effort and command-line work involved in obtaining and renewing SSL certificates, which can be a significant hurdle for beginners. 
- **Streamlining configuration:** 
    By providing a point-and-click interface for common tasks, it allows users to set up a reverse proxy quickly without needing to be an Nginx expert.