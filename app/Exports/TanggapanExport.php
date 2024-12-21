<?php

namespace App\Exports;

use App\Tanggapan;
use Maatwebsite\Excel\Concerns\FromCollection;

class TanggapanExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Tanggapan::all();
    }
}
