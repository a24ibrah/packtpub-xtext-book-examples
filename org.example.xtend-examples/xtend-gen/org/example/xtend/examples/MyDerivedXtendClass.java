package org.example.xtend.examples;

import org.example.xtend.examples.MyFirstXtendClass;

@SuppressWarnings("all")
public class MyDerivedXtendClass extends MyFirstXtendClass {
  @Override
  public boolean bar(final String input) {
    return true;
  }
}
