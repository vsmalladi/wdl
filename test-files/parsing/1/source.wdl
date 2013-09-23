composite_task foo {
  
  step atask[version=0] {
    output: File("foo.txt") as x;
  }

  for ( item in foo ) {
    step btask[version=0] {
      input: p0=item, p1=global;
      output: File("bar.txt") as y;
    }

    step ctask[version=0] {
      input: p0=item, p1=y;
      output: File("quux.txt") as z;
    }

    for ( alpha in beta ) {
      step dtask[version=0] {
        input: p0=alpha;
      }
    }
  }

  step gtask[version=0] {
    input: p0=x, p1=y, p2=z;
    output: File("report.txt") as r;
  }

}
