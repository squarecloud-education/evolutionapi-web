# 🔗 Square Cloud Evolution API
## Host Evolution API on Square Cloud ☁️

> 🌐 Easily host your Evolution API on Square Cloud and create powerful chat automations with it.

---

## 🚀 How to host this project on Square Cloud

New to Square Cloud? Follow these steps in order. Evolution API needs a PostgreSQL database, so besides the upload you will create the database and prepare the project on your computer.

### 1️⃣ Create your Square Cloud account

Sign up on the [Square Cloud signup page](https://squarecloud.app/en/signup) with your email.

### 2️⃣ Choose a plan

Hosting on Square Cloud requires an active plan, and both the database and the upload ask for one, so choose it now.

Evolution API needs **3 GB of RAM** and a PostgreSQL database: choose the **[Standard plan](https://squarecloud.app/en/pricing)**, which has 4 GB of RAM, 4 vCPU and includes managed databases. Compare every plan and its price on the [pricing page](https://squarecloud.app/en/pricing).

### 3️⃣ Create the PostgreSQL database

1. Create a PostgreSQL database in the [Square Cloud dashboard](https://squarecloud.app/en/dashboard) (see [how to create a managed database](https://docs.squarecloud.app/en/tutorials/how-to-deploy-your-database)).
2. On the database page, copy the connection URL and download the certificate files (`.crt` and `.key`).
3. Evolution API reads the certificate as a `.p12` file. Convert it with [OpenSSL](https://www.openssl.org/) and choose an export password:
   ```bash
   openssl pkcs12 -export -out client-identity.p12 -inkey <certificate>.key -in <certificate>.crt
   ```

### 4️⃣ Download and configure the project

1. Download **`project.zip`** from the [latest release](https://github.com/squarecloud-education/evolutionapi-web/releases/latest) and extract it.
2. Put the `client-identity.p12` file in the extracted folder.
3. Open the `.env` file and set:
   - `DATABASE_CONNECTION_URI`: your database URL, ending with `?sslmode=require&sslidentity=client-identity.p12&sslpassword=<export password>`
   - `SERVER_URL`: `https://<subdomain>.squareweb.app`, with the subdomain you will use in step 6, for example `https://my-evolution-api.squareweb.app`
   - `AUTHENTICATION_API_KEY`: a long random value only you know. The one in the file is public, so always replace it.

### 5️⃣ Create the database tables

Install [Node.js 24](https://nodejs.org/) on your computer. Then, in the extracted folder, run:

```bash
npm install
npm run db:deploy        # on Windows: npm run db:deploy:win
```

### 6️⃣ Upload it to Square Cloud

1. Delete the `node_modules` folder that `npm install` created: Square Cloud installs the dependencies itself.
2. Select **all files inside the folder** (including `.env`, `.p12` and the hidden `.squarecloud` folder) and compress them into a new `.zip`. Compress the files, not the folder itself: `squarecloud.app` must be at the root of the zip.
3. Open the [Square Cloud upload page](https://squarecloud.app/en/dashboard/new).
4. Select the **zip** option and send your zip.
5. Select **Web Publication** and use the same subdomain as your `SERVER_URL`, for example `my-evolution-api`.
6. Click **Deploy** and wait a few minutes: the first start builds the project.

![Uploading a project to Square Cloud](https://cdn.squarecloud.app/docs/articles/dashboard/uploading.gif)

### 7️⃣ Open the manager

Open `https://my-evolution-api.squareweb.app/manager`, enter your `SERVER_URL` and `AUTHENTICATION_API_KEY`, and create your first WhatsApp instance.

📖 Need more details, like the optional Redis cache? Read the [full Evolution API guide](https://docs.squarecloud.app/en/tutorials/how-to-deploy-evolution-api) in the Square Cloud documentation.

> ⚠️ **Updating from an older release?** Evolution API 2.3.7 adds a database migration: run step 5 against your database again before uploading the new version.

---

## Evolution API

Evolution API is a solution developed to control Whatsapp and other messaging services.

### Integrations

Evolution API supports various integrations to enhance its functionality. Below is a list of available integrations and their uses:

- [Typebot](https://typebot.io/):
  - Build conversational bots using Typebot, integrated directly into Evolution with trigger management.

- [Chatwoot](https://www.chatwoot.com/):
  - Direct integration with Chatwoot for handling customer service for your business.

- [RabbitMQ](https://www.rabbitmq.com/):
  - Receive events from the Evolution API via RabbitMQ.

- [Apache Kafka](https://kafka.apache.org/):
  - Receive events from the Evolution API via Apache Kafka for real-time event streaming and processing.

- [Amazon SQS](https://aws.amazon.com/pt/sqs/):
  - Receive events from the Evolution API via Amazon SQS.

- [Socket.io](https://socket.io/):
  - Receive events from the Evolution API via WebSocket.

- [Dify](https://dify.ai/):
  - Integrate your Evolution API directly with Dify AI for seamless trigger management and multiple agents.

- [OpenAI](https://openai.com/):
  - Integrate your Evolution API with OpenAI for AI capabilities, including audio-to-text conversion, available across all Evolution integrations.

- Amazon S3 / Minio:
  - Store media files received in [Amazon S3](https://aws.amazon.com/pt/s3/) or [Minio](https://min.io/). 

### Credits

Evolution API Official repository [here](https://github.com/EvolutionAPI/evolution-api)
### License

Evolution API is licensed under the Apache License 2.0, with the following additional conditions:

1. **LOGO and copyright information**: In the process of using Evolution API's frontend components, you may not remove or modify the LOGO or copyright information in the Evolution API console or applications. This restriction is inapplicable to uses of Evolution API that do not involve its frontend components.

2. **Usage Notification Requirement**: If Evolution API is used as part of any project, including closed-source systems (e.g., proprietary software), the user is required to display a clear notification within the system that Evolution API is being utilized. This notification should be visible to system administrators and accessible from the system's documentation or settings page. Failure to comply with this requirement may result in the necessity for a commercial license, as determined by the producer.

Please contact contato@evolution-api.com to inquire about licensing matters.

Apart from the specific conditions mentioned above, all other rights and restrictions follow the Apache License 2.0. Detailed information about the Apache License 2.0 can be found at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

© 2025 Evolution API
