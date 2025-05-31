from django.db import models
from profissionais.models import Profissional  # Importa o modelo Profissional

class Consulta(models.Model):
    profissional = models.ForeignKey(Profissional, on_delete=models.CASCADE, related_name="consultas")
    data = models.DateField()
    horario = models.TimeField()

    def __str__(self):
        return f"{self.paciente} com {self.profissional.nome} em {self.data} às {self.horario}"
