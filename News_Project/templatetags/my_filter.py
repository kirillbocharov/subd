from django import template
from sql_requests.select import get_name_user

register = template.Library()


@register.filter
def get_name_by_id(value):
    return get_name_user(value)
