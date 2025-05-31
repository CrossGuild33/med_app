from rest_framework.routers import DefaultRouter
from django.urls import path, include
from .views import ProfissionalViewSet

router = DefaultRouter()
router.register(r'', ProfissionalViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
