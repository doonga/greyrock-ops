# Omada Controller

## Known Issues

- **Publishing in Reverse Proxy** bug as setting X-Forwarded-Proto header causes 404 error <https://community.tp-link.com/en/business/forum/topic/557218?replyId=1127058>

  - **Set Management Port to 443**: This works with both nginx and traefik. However, this is an unpriveledged port and you must pass "--sysctl net.ipv4.ip_unprivileged_port_start=0" as an argument in your docker startup config. (No Longer Required with v5.9 and above)
  - **Keep Management Port as default 8043**: This only works with traefik (as of Oct 17, 2022) and with nginx as of v5.9. You need to define a regex rule to redirect login traffic to correct port:

    ```sh
    spec:
      redirectRegex:
        regex: "^https:\\/\\/([^\\/]+)\\/?$"
          replacement: "https://omada.domain.com/${OMADA_CONTROLLER_ID}/login"
    ```

    and set X-Forwarded-Proto header to null:

    ```sh
    spec:
      headers:
        customRequestHeaders:
          Host: "omada.domain.com:8043"
          X-Forwarded-Proto: ""
        customResponseHeaders:
          Host: "omada.domain.com"
    ```

- **Device Discovery**

  - Requires manually configuring DHCP Option 138: <https://www.tp-link.com/us/support/faq/2764/>
  - Metallb does not support broadcasts for UDP, setting the pod to use the host network instead will allow discovery of devices.
