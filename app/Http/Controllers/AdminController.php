<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\PengaduanExport;
use App\Exports\MasyarakatExport;
use App\Exports\TanggapanExport;
use App\Exports\PetugasExport;
use App\Pengaduan;
use App\Tanggapan;
use App\Masyarakat;
use App\Petugas;
use PDF;

class AdminController extends Controller
{
    public function indexAdmin()
    {
        $data['admin'] = Petugas::where('level','admin')->count();
        $data['petugas'] = Petugas::where('level','petugas')->count();
        $data['masyarakat'] = Masyarakat::count();
        $data['pengaduan'] = Pengaduan::where('status','!=','selesai')->count();
        $data['pengaduanSelesai'] = Pengaduan::where('status','selesai')->count();
        $data['tanggapan'] = Tanggapan::count();
    	return view('admin.home',$data);
    }

    public function jumlahCetakPost()
    {
        $data['admin'] = Petugas::where('level','admin')->count();
        $data['petugas'] = Petugas::where('level','petugas')->count();
        $data['masyarakat'] = Masyarakat::count();
        $data['pengaduan'] = Pengaduan::where('status','!=','selesai')->count();
        $data['pengaduanSelesai'] = Pengaduan::where('status','selesai')->count();
        $data['tanggapan'] = Tanggapan::count();
        
        $pdf = PDF::loadview('admin.cetakJumlah',$data);
        return $pdf->download('laporan-jumlah-data-pdf');        
    }

    public function viewMasyarakat()
    {
    	$data['masyarakat'] = Masyarakat::all();
    	return view('admin.homeMasyarakat',$data);	
    }

    public function masyarakatCetakPost()
    {
        $data['masyarakat'] = Masyarakat::all();
 
        $pdf = PDF::loadview('admin.cetakMasyarakat',$data);
        return $pdf->download('laporan-data-masyarakat-pdf');
    }

    public function viewPengaduan()
    {
    	$data['pengaduan'] = Pengaduan::where('status',"!=","selesai")->get();
    	$data['pengaduanSelesai'] = Pengaduan::where('status',"selesai")->get();
    	return view('admin.homePengaduan',$data);
    }

    public function pengaduanCetakPost()
    {
    	$data['pengaduan'] = Pengaduan::where('status',"!=","selesai")->get();
 
    	$pdf = PDF::loadview('admin.cetakPengaduan',$data);
    	return $pdf->download('laporan-pengaduan-pdf');
    }

    public function pengaduanSelesaiCetakPost()
    {
        $data['pengaduanSelesai'] = Pengaduan::where('status',"selesai")->get();

        $pdf = PDF::loadview('admin.cetakPengaduanSelesai',$data);
        return $pdf->download('laporan-pengaduan-selesai-pdf');
    }

    public function viewPetugas()
    {
    	$data['petugas'] = Petugas::all();
    	return view('admin.homePetugas',$data);
    }

    public function petugasCetakPost()
    {
        $data['petugas'] = Petugas::all();
 
        $pdf = PDF::loadview('admin.cetakPetugas',$data);
        return $pdf->download('laporan-data-petugas-pdf');
    }

    public function viewTanggapan()
    {
    	$data['tanggapan'] = Tanggapan::get();
    	return view('admin.homeTanggapan',$data);
    }

    public function tanggapanCetakPost()
    {
        $data['tanggapan'] = Tanggapan::get();
 
        $pdf = PDF::loadview('admin.cetakTanggapan',$data);
        return $pdf->download('laporan-tanggapan-pdf');
    }

    public function pengaduanExcelPost()
    {
           return Excel::download(new PengaduanExport, 'Data_Pengaduan.xlsx');


}

    public function masyarakatExcelPost()
    {
           return Excel::download(new MasyarakatExport, 'Data_Masyarakat.xlsx');


}


    public function petugasExcelPost()
    {
           return Excel::download(new PetugasExport, 'Data_Petugas.xlsx');


}


    public function tanggapanExcelPost()
    {
           return Excel::download(new TanggapanExport, 'Data_Tanggapan.xlsx');


}


 public function masyarakatDocx()
    {

     $masyarakat = Masyarakat::all();
        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        foreach ($masyarakat as $row) 
        $section = $phpWord->addSection();
        $section->addText($row->nik);
        $section->addTextBreak(1);
        $section->addText($row->nama);
        $section->addTextBreak(1);
        $section->addText($row->username);  
        $section->addTextBreak(1);
        $section->addText($row->telp);  
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
        try {
            $objWriter->save(storage_path('Data Masyarakat.docx'));
        } catch (Exception $e) {
        }
        return response()->download(storage_path('Data Masyarakat.docx'));
    }



 public function petugasDocx()
    {
       $petugas = Petugas::all();
        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        foreach ($petugas as $row) 
        $section = $phpWord->addSection();
        $section->addText($row->nama_petugas);
        $section->addTextBreak(1);
        $section->addText($row->username);
        $section->addTextBreak(1);
        $section->addText($row->telp);  
        $section->addTextBreak(1);
        $section->addText($row->level);  
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
        try {
            $objWriter->save(storage_path('Data Petugas.docx'));
        } catch (Exception $e) {
        }
        return response()->download(storage_path('Data Petugas.docx'));
    }

     public function pengaduanDocx()
    {
        $pengaduan = Pengaduan::all();
        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        foreach ($pengaduan as $row) 
        $section = $phpWord->addSection();
        $section->addText($row->tgl_pengaduan);
        $section->addTextBreak(1);
        $section->addText($row->nik);
        $section->addTextBreak(1);
        $section->addText($row->isi_laporan);  
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
        try {
            $objWriter->save(storage_path('Data Pengaduan.docx'));
        } catch (Exception $e) {
        }
        return response()->download(storage_path('Data Pengaduan.docx'));
    }

     public function tanggapanDocx()
    {
       $tanggapan = Tanggapan::all();
        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        foreach ($tanggapan as $row) 
        $section = $phpWord->addSection();
        $section->addText($row->tgl_tanggapan);
        $section->addTextBreak(1);
        $section->addText($row->isi_laporan);
        $section->addTextBreak(1);
        $section->addText($row->tanggapan);  
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
        try {
            $objWriter->save(storage_path('Data tanggapan.docx'));
        } catch (Exception $e) {
        }
        return response()->download(storage_path('Data tanggapan.docx'));
    }
}