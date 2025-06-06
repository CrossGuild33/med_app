from django.db import models


class Profissional(models.Model):
    nome_social = models.CharField(max_length=100)
    profissao = models.CharField(max_length=100, default="Não informado")
    endereco = models.CharField(max_length=200, default="Não informado")
    contato = models.CharField(max_length=100, default="Não informado")  # Pode ser telefone, e-mail ou ambos

    def __str__(self):
        return f'{self.nome_social} - {self.profissao}'
