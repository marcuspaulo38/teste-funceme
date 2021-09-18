<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    public function run()
    {
        $user = User::insert([
            'name' => 'Marcus Paulo',
            'email' => 'marcuspaulo@funceme.teste',
            'password' => bcrypt('teste'),
        ]);

        $user = User::insert([
            'name' => 'Robson Franklin',
            'email' => 'robson@funceme.br',
            'password' => bcrypt('teste'),
        ]);

        $user = User::insert([
            'name' => 'Marcelo Rodrigues',
            'email' => 'marcelo@funceme.br',
            'password' => bcrypt('teste'),
        ]);

    }
}

