<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\AssetStatusEnum;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Asset extends Model
{
    use HasFactory;

    /** 
     * @var array <int, string>
     */
    protected $table = 'asset';          // Table name
    protected $primaryKey = 'id';  // Primary key
    public $incrementing = true;         // Auto-increment
    protected $keyType = 'int';

    protected $fillable = [
        'category_id',
        'location_id',
        'manufacturer_id',
        'assigned_to_user_id',
        'asset_tag',
        'name',
        'serial_number',
        'model_name',
        'purchase_date',
        'purchase_price',
        'status',
        'notes',

    ];

    protected $casts = [
        'purchase_date' => 'date',
        'purchase_price' => 'decimal:2',
        'status' => AssetStatusEnum::class,
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
        
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
        
    }

    public function manufacturer()
    {
        return $this->belongsTo(Manufacturer::class);
        
    }

    public function assignedTo()
    {
        return $this->belongsTo(User::class, 'assigned_to_user_id');
        
    }
}

