<?php

namespace Brackets\AdminAuth\Tests\Models;

use Brackets\AdminAuth\Activation\Contracts\CanActivate as CanActivateContract;
use Brackets\AdminAuth\Activation\Traits\CanActivate;
use Brackets\AdminAuth\Notifications\ResetPassword;
use Brackets\AdminAuth\Notifications\ActivationNotification;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

class TestBracketsUserModel extends Authenticatable implements CanActivateContract
{
    use Notifiable;
    use CanActivate;
    use SoftDeletes;
    use HasRoles;

    protected $fillable = [
        "email",
        "password",
        "first_name",
        "last_name",
        "activated",
        "forbidden",
        "language",
    ];

    protected $hidden = [
        "password",
        "remember_token",
    ];

    protected $dates = [
        "created_at",
        "updated_at",
        "deleted_at",
    ];

    protected $appends = ['full_name', 'resource_url'];

    /* ************************ ACCESSOR ************************* */

    /**
     * Resource url to generate edit
     *
     * @return \Illuminate\Contracts\Routing\UrlGenerator|string
     */
    public function getResourceUrlAttribute()
    {
        return url('/admin/admin-users/' . $this->getKey());
    }

    /**
     * Full name for admin user
     *
     * @return string
     */
    public function getFullNameAttribute()
    {
        return $this->first_name . " " . $this->last_name;
    }

    /**
     * Send the password reset notification.
     *
     * @param    string $token
     * @return  void
     */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(app(ResetPassword::class, ['token' => $token]));
    }

    /**
     * Send the password reset notification.
     *
     * @param  string $token
     * @return void
     */
    public function sendActivationNotification($token)
    {
        $this->notify(app(ActivationNotification::class, ['token' => $token]));
    }

    /* ************************ RELATIONS ************************ */


}
