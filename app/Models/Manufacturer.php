<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Manufacturer extends Model
{
    use HasFactory;

    /**
    * Explicit table name (useful when table name differs in case or spelling)
    *
    * @var string
    */
    protected $table = 'manufacturer';          // Table name
    protected $primaryKey = 'id';  // Primary key
    public $incrementing = true;         // Auto-increment
    protected $keyType = 'int';


    /** 
    * @var array <int, string>
    */

    protected $fillable = [
        'name',
        'url',
        'support_url',
        'support_email',
        'support_phone',

    ];

    public function assets()
    {
        return $this->hasMany(Asset::class);
        
    }
}

