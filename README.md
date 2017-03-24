# integration-env

## Lendo test integration environment

Docker Engine **1.13.0+** required

#### Firstly - initialize environment
```bash
make init
```
File `.env` will appear. Adjust paths to your needs (if you store your source code elsewhere).

#### Running

To set up whole environment you need to run (wake up containers):

```bash
make
```

If you don't have cloned services already, run this command - it will save source in `src` directory:

```bash
make clone
```

To run containers (default `make` action):

```bash
make run
```

If you have fresh instance of `eventstorage` run:
```bash
make startup
```

And to kill and remove containers:

```bash
make clean
```
---
All services expose `8000` port and they communicate on this post between each other.

If you want to make an API call to particular service, use port from the table below.

| service                       | port |
|-------------------------------|------|
| user_service                  | 9011 |
| credit_data_service           | 9012 |
| pep_service                   | 9013 |
| application_handler_service   | 9014 |
| sms_service                   | 9015 |
| point_service                 | 9016 |
| mail_service                  | 9017 |
| message_dispatcher            | 9018 |
| application_service           | 9019 |
| integration_response_service  | 9020 |
| partner_service               | 9021 |
| tracking_service              | 9022 |
