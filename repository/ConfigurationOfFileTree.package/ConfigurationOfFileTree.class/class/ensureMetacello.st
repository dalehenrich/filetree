private
ensureMetacello
  Transcript
    cr;
    show: 'ensureMetacello [1]'.
  (self
    baseConfigurationClassIfAbsent: [ 
      Transcript
        cr;
        show: 'ensureMetacello [2]' ])
    ensureMetacello