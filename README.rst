jnrowe-fixes
============

.. warning::
   This repository is unmaintained as - like many others - I've completely lost
   interest in submitting fixes to Gentoo.  If you're inside the EADS firewall
   you'll find fixes against upstream's tree in the shared ``gentoo-fixes``
   repository.

Packages with fixes submitted to the `Gentoo BTS`_ that have yet to be
applied.  Its main purpose is my staging ground, so I can separately
manage upstreamed fixes.

If you find any problems with ebuilds in this overlay either file an
issue_ or drop me an email_.

.. warning::

   This repository uses thin manifests, which requires a moderately recent
   version of ``portage`` to function correctly(2.1.10.18 or newer).  Using
   older versions is not supported!

``oilman`` integration
----------------------

If you use ``oilman`` to manage your repositories you can call::

    # oilman --add-repository jnrowe::fixes

Or, if you'd rather use the rsync_ mirror::

    # oilman --method=rsync --add-repository jnrowe::fixes

To sync the repository::

    # oilman --sync jnrowe::fixes # Sync this repository only
    # oilman --sync all # or sync all repositories

``layman`` integration
----------------------

If you use layman_ to sync your repositories you can simply add this
repository to the supported list.

If you're using layman v1.2.4 or newer, then the ``support/layman2.xml`` should
be added to the ``overlays`` section of ``/etc/layman/layman.conf``, for
example::

    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                file:///var/lib/repos/jnrowe-fixes/support/layman2.xml

If you're using layman v1.2.3 or earlier, then ``support/layman.xml`` should be
added to the ``overlays`` section of ``/etc/layman/layman.conf``, for example::

    overlays  : http://www.gentoo.org/proj/en/overlays/layman-global.txt
                file:///var/lib/repos/jnrowe-fixes/support/layman.xml

Then you can add the overlay using ``layman``::

    # layman -a jnrowe-fixes

**Note**: You may need to run ``layman --fetch`` or perform a sync operation
before this command will work.

To sync the repository you can use ``layman`` directly, either syncing just
this overlay or all your overlays at once::

    # layman -s jnrowe-fixes # Sync just jnrowe-fixes
    # layman -S # or sync all layman managed overlays

Or if you're an eix_ user you can use ``eix-sync`` to update the repositories
and the ``eix`` database at the same time, first tell ``eix-sync`` to update
the repository::

    # echo "jnrowe-fixes" >>/etc/eix-sync.conf # Sync just jnrowe-fixes
    # echo "*" >>/etc/eix-sync.conf # or sync all layman managed overlays

Finally, use ``eix-sync`` to update the specified repositories and ``eix``
package database.

.. _Gentoo BTS: http://bugs.gentoo.org/
.. _email: jnrowe@gmail.com
.. _issue: http://github.com/JNRowe/jnrowe-fixes/issues
.. _layman: http://layman.sourceforge.net
.. _eix: http://eix.sourceforge.net
.. _rsync: http://rsync.samba.org/
