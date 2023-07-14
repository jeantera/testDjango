## Wyndo

> Wyndo is a web application that allows access to a catalog of products previously registered from a POS (Point of Sale) by retailers. The goal is to allow Wyndo users to reserve products from inventory for purchase in a local area, as well as to provide retailers with a wider range of visibility for their businesses.

## System requirements

- Python v3.11
- Postgres v15
- Redis v7.0

## Installation

1. Create a copy of file `.env.template` and rename it `.env`

   ```
   cp .env.template .env
   ```

2. Create a virtual environment using [venv](https://docs.python.org/3/library/venv.html) module (for IDE compatibility purposes)

   ```
   python3.11 -m venv .venv && source .venv/bin/activate
   ```

3. Installing dependencies (for IDE compatibility purposes)
   
   ```
   pip install -r requirements.txt
   ```

4. Start-up of project containers

   ```
   docker-compose up -d
   ```

5. Running project migrations

   ```
   docker exec -it wyndo-app python src/manage.py migrate
   ```

6. Create Django superuser

   ```
   docker exec -it wyndo-app python src/manage.py createsuperuser
   ```

7. Once the superuser has been created, verify at the following URL http://localhost:8000/admin that you can enter your credentials.

## How to send an Email
- Send a plain email

Use the `EmailMessage` class provided by Django, add the subject, message and the recipient list (it has to be a list even when it's only one)
   ```
    subject = 'Email subject'
    message = 'Email body'
    recipient_list = ['me@me.com', ]
    email = EmailMessage(subject=subject, body=message, to=recipient_list)
    email.send()
   ```

- Send and email with a template

Use the `EmailMessage` class provided by Django just like the previous example, but it requires the template and the object with the information we want to add to the template, after we instantiate the class change the attribute `content_subtype` to html
   ```
  message = get_template("emails/mail_template.html").render(Context({
        'object': object.get_serialized_data()
    }))
    mail = EmailMessage(
        subject='Email subject',
        body=message,
        to=['me@me.com', ],
    )
    mail.content_subtype = "html"
    return mail.send()
   ```

That's all! :rocket: