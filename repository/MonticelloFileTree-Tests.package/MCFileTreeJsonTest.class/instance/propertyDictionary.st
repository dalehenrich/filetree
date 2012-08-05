tests
propertyDictionary
    ^ Dictionary new
        at: 'name' put: 'John Smith';
        at: 'boundary' put: 'sky';
        at: 'Business' put: 'none or yours';
        at: 'age' put: 25;
        at: 'registered' put: true;
        at: 'phoneNumber'
            put:
                {(Dictionary new
                        at: 'type' put: 'home';
                        at: 'number' put: '212 555-1234';
                        yourself).
                    (Dictionary new
                        at: 'type' put: 'fax';
                        at: 'number' put: '646 555-4567';
                        yourself)};
        yourself