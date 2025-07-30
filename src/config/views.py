import os

from django.shortcuts import render
from config import settings


def home(request):
    return render(request, 'home.html')




