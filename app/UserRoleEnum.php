<?php

namespace App;

enum UserRoleEnum: string
{
    case SUPER_ADMIN = 'admin';
    case INVENTORY_MANAGER = 'inventory_manager';
    case INVENTORY_USER = 'inventory_user'; 

    public  function label(): string
    {
        return match($this) {
            self::SUPER_ADMIN => 'Admin',
            self::INVENTORY_MANAGER => 'Inventory Manager',
            self::INVENTORY_USER => 'Inventory User',
        };
    }   
}
