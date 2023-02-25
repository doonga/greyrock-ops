OIDC:
Run this in order to create your auth token and refresh tokens.

kubelogin setup --v 1 --oidc-issuer-url=https://auth0.greyrock.io/ --oidc-client-id=<client ID> --oidc-client-secret=<client secret> --oidc-extra-scope email,offline_access
