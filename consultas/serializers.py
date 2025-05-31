from rest_framework import serializers
from .models import Consulta

class ConsultaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Consulta
        fields = '__all__'

    def validate(self, data):
        if data['data'] is None or data['horario'] is None:
            raise serializers.ValidationError("Data e hora são obrigatórios.")
        return data