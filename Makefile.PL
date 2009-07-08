use 5.008;
use ExtUtils::MakeMaker;
WriteMakefile(
  NAME => 'TL1',
  VERSION_FROM => 'lib/TL1/Toolkit.pm',
  ABSTRACT_FROM => 'lib/TL1/Toolkit.pm',
  AUTHOR => 'Ronald van der Pol <rvdp@sara.nl>, Andree Toonk <andree@sara.nl>',
  PREREQ_PM => {
    'threads::shared' => 0,
    'Thread::Queue::Any' => 0,
    'Net::Telnet' => 0,
    'Time::localtime' => 0,
    'Date::Manip' => 0,
  }
);
