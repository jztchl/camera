# Generated by Django 4.0.1 on 2022-02-01 04:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_delete_booking'),
    ]

    operations = [
        migrations.CreateModel(
            name='booking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bookingdatefrom', models.DateField(default='', max_length=100)),
                ('bookingdateto', models.DateField(default='', max_length=100)),
                ('bookeduser', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.user')),
                ('productid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.product')),
                ('sellerid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.seller')),
            ],
        ),
    ]