---
is_service: true
---

NFS, or Network File System, is a distributed file system protocol that allows a user on a client computer to access files over a network as if they were on a local disk. It works on a client-server model, where a server shares files and directories, and client computers can access and manipulate them. This makes it possible to share data across a network and centralize storage, reducing the need for local storage on each machine. 

- **How it works:** When a user on a client machine opens a file, the NFS client communicates with the NFS server using [Remote Procedure Call (RPC)](https://www.google.com/search?q=Remote+Procedure+Call+%28RPC%29&num=10&newwindow=1&sca_esv=b8281854a4bc4e84&sxsrf=AE3TifP-13tl7Jb6rN-RFVt0mS3SOto9yA%3A1761860748193&ei=jNwDaaS7C8OE0PEPwbjzcQ&ved=2ahUKEwj_tsfq9syQAxXnDTQIHV0eMDUQgK4QegQIAxAB&uact=5&oq=what+is+nfs&gs_lp=Egxnd3Mtd2l6LXNlcnAiC3doYXQgaXMgbmZzMgsQABiABBiRAhiKBTILEAAYgAQYsQMYgwEyCxAAGIAEGJECGIoFMgsQABiABBiRAhiKBTILEAAYgAQYkQIYigUyCxAAGIAEGJECGIoFMgUQABiABDIFEAAYgAQyBRAAGIAEMgUQABiABEj5YlCaXVjsYHACeAGQAQCYAVGgAdQBqgEBM7gBA8gBAPgBAZgCBaAC7AHCAgoQABiwAxjWBBhHwgINEAAYgAQYsAMYQxiKBcICCBAAGIAEGLEDwgIOEAAYgAQYsQMYgwEYigWYAwCIBgGQBgqSBwE1oAfzD7IHATO4B-IBwgcFMC4xLjTIBxE&sclient=gws-wiz-serp&mstk=AUtExfC1zjjVPrnRa6J69FjT5WOWXjwyZt6kbYX3BnACfIpbUecvOf5pwwGMdCohlRX-8b_HkP4GGqFRxLW6Io8Cq14P5qCYdjem320xEbf3NV7otD0sj-JdZ7MVpLHcjNx2HcvO8B_OSLr9KKIuIyNg9BCjvvAeAqGfbMpr0g6LyZwgMTw&csui=3) to retrieve the file data. The client then displays the file to the user as if it were on their local machine.
- **Key benefits:**
    - **Centralized storage:** Data can be stored on a single server, making it accessible to multiple clients and simplifying management.
    - **Space saving:** Client machines use less local disk space since they can access shared data from the server.
    - **Cross-platform access:** NFS is widely used with Unix and Linux systems but can also be used with Windows via optional components.
- **Versions:** NFS has evolved through several versions, with later versions like NFSv4 offering improvements in performance, scalability, and security.