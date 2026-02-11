<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class UserDailyTraffic extends Model
{
    protected $table = 'user_daily_traffic';
    protected $fillable = [
        'user_id',
        'date',
        'used',
        'cumulative',
        'reset_flag',
    ];
    public $timestamps = false;
}
?>