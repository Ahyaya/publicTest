# include <stdio.h>
# include <stdlib.h>

int main()
{
  int pf,n;
  FILE *inf;
  char c;
  printf("%s\n", "Test Start...\n\n");
  system("grep -m 1 -b -o \"VsMax(c)\" EoSconfig.cfg > temp.dir");
  inf=fopen("temp.dir","r");
  fscanf(inf,"%d:",&pf);
  fclose(inf);
  inf=fopen("EoSconfig.cfg","r");
  fseek(inf,pf,SEEK_SET);
  fscanf(inf,"VsMax(c)%*c%c,",&c);
  fclose(inf);
  printf("n=%c\n",c);
  return 0;
}
