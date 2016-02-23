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
   return 0;
}
