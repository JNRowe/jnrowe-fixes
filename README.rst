fixes-overlay
=============

Packages with fixes submitted to the `Gentoo BTS`_ that have yet to be
applied.  Its main purpose is my staging ground, so I can separately
manage upstreamed fixes.

If you find any problems with ebuilds in this overlay either drop me an
email_ or file an issue_.  Locally, bugs are managed with ditz_, so if
you're working with a clone of the repository you can report, list and
fix bugs using ``dev-util/ditz`` from jnrowe-misc_.

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
.. _ditz: http://ditz.rubyforge.org/
.. _jnrowe-misc: http://github.com/JNRowe/misc-overlay/tree
.. _layman: http://layman.sourceforge.net
.. _eix: http://eix.sourceforge.net
