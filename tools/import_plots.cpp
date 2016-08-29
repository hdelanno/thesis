{
   gSystem->cd("/Users/tlenzi/Documents/PhD/writing/img/plots");
   TFile* f(TFile::Open("/Users/tlenzi/Documents/PhD/software/TestBeam_v2/results/plot.root"));
   TIter nex(f->GetListOfKeys());
   TKey* key;
   while ((key = (TKey*) nex())) {
      TClass *cl = gROOT->GetClass(key->GetClassName());
      if (!cl->InheritsFrom("TCanvas")) continue;
      TCanvas* c = (TCanvas*) key->ReadObj();
      c->SaveAs(".pdf");
   }

   TFile* f2(TFile::Open("/Users/tlenzi/Documents/PhD/software/Irradiation/plot.root"));
   TIter nex2(f2->GetListOfKeys());
   TKey* key2;
   while ((key2 = (TKey*) nex2())) {
      TClass *cl = gROOT->GetClass(key2->GetClassName());
      if (!cl->InheritsFrom("TCanvas")) continue;
      TCanvas* c = (TCanvas*) key2->ReadObj();
      c->SaveAs(".pdf");
   }

   return 0;
}
